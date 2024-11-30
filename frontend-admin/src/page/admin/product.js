import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { getMethod, deleteMethod ,uploadSingleFile} from '../../services/request';
import Swal from 'sweetalert2';
import { formatMoney } from '../../services/money';



const AdminProduct = ()=>{
    const [items, setItems] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    useEffect(()=>{
        getProduct();
    }, []);

    async function getProduct() {
        var response = await getMethod('/api/san-pham');
        var result = await response.json();
        setItems(result)

    }



    async function deleteProduct(id){
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa sản phẩm này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
            reverseButtons: true,
        }).then(async (result) => {
            if (result.isConfirmed) {
                const response = await deleteMethod('/api/san-pham/' + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    getProduct();
                } else if (response.status > 300) {
                    const result = await response.json();
                    toast.warning(result.message);
                }
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                console.log("Hủy thao tác xóa.");
            }
        });
    }



    return (
        <>
            <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong class="text-left"><i className='fa fa-list'></i> Quản Lý Sản Phẩm</strong>
                <div class="search-wrapper d-flex align-items-center">
                    <div class="search-container">
                    </div>
                    <a href='add-product' class="btn btn-primary ms-2"><i className='fa fa-plus'></i></a>
                </div>
            </div>
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">List product</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Ảnh</th>
                                {/*<th>Mã sản phẩm</th>*/}
                                <th>Tên sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Thương hiệu</th>
                                <th>Chất liệu</th>
                                <th>Đế giày</th>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Người cập nhật</th>
                                <th>Trạng thái</th>
                                <th class="sticky-col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            {items.map((item=>{
                                    return <tr>
                                        <td>{item.id}</td>
                                        <td><img src={item.anh} className='imgtable'/></td>
                                        {/*<td>{item.maSanPham}</td>*/}
                                        <td>{item.tenSanPham}</td>
                                        <td>{item.giaBan}</td>
                                        <td>{item.thuongHieu?.tenThuongHieu}</td>
                                        <td>{item.chatLieu?.tenChatLieu}</td>
                                        <td>{item.deGiay?.tenDeGiay}</td>
                                        <td>{item.ngayTao}</td>
                                        <td>{item.nguoiTao}</td>
                                        <td>{item.nguoiCapNhat}</td>
                                        <td
                                            style={{
                                                textAlign: "center",
                                                color: item.trangThai === 0 ? "#6c757d" : "#155724", // Xám đậm hoặc Xanh đậm
                                            }}
                                        >
                                            {item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng"}
                                        </td>
                                        <td class="sticky-col">
                                            <a href={"add-product?id=" + item.id} class="edit-btn"><i
                                                className='fa fa-edit'></i></a>
                                            <br/> <br/>
                                            <a target='_blank' href={"sanphamchitiet?sanpham=" + item.id}
                                               class="edit-btn"><i className='fa fa-eye'></i></a>
                                            {/*<button onClick={() => deleteProduct(item.id)} class="delete-btn"><i*/}
                                            {/*    className='fa fa-trash'></i></button>*/}
                                        </td>
                                    </tr>
                            }))}
                        </tbody>
                    </table>

                </div>
            </div>

        </>
    );
}

export default AdminProduct;