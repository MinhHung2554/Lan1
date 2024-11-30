import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { getMethod ,postMethodPayload, deleteMethod} from '../../services/request';
import { formatMoney} from '../../services/money';
import Swal from 'sweetalert2';


var size = 5
var url = '/api/phieu-giam-gia/all?&size='+size+'&sort=id,desc&page=';
const AdminPhieuGiamGia = ()=>{
    const [items, setItems] = useState([]);
    const [currentPage, setCurrentPage] = useState(0);
    const [pageCount, setPageCount] = useState(0);
    useEffect(()=>{
        getPhieu();
    }, []);


    async function getPhieuGiamGia() {
        var response = await getMethod('/api/phieu-giam-gia');
        var result = await response.json();
        setItems(result)
    }
    const getPhieu = async() =>{
        var response = await getMethod('/api/phieu-giam-gia/all?&size='+size+'&sort=id,desc&page='+0)
        var result = await response.json();
        console.log(result);
        setItems(result.content)
        setPageCount(result.totalPages)
        url = '/api/phieu-giam-gia/all?&size='+size+'&sort=id,desc&page='
    };
    async function deletePhieuGiamGia(id){
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa mục này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
            reverseButtons: true,
        }).then(async (result) => {
            if (result.isConfirmed) {
                const response = await deleteMethod('/api/phieu-giam-gia/' + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    getPhieuGiamGia(); // Hàm cập nhật dữ liệu sau khi xóa
                } else if (response.status === 417) {
                    const result = await response.json();
                    toast.warning(result.defaultMessage); // Thông báo lỗi từ server
                } else {
                    toast.warning("Xóa thất bại"); // Thông báo lỗi chung
                }
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                console.log("Hủy thao tác xóa.");
            }
        });

    }
    const handlePageClick = async (data)=>{
        var currentPage = data.selected
        var response = await getMethod(url+currentPage)
        var result = await response.json();
        setItems(result.content)
        setPageCount(result.totalPages)
    }

    return (
        <>
            <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong class="text-left"><i className='fa fa-list'></i> Quản Lý Phiếu Giảm Giá</strong>
                <div class="search-wrapper d-flex align-items-center">
                    <div class="search-container">
                    </div>
                    <a href='add-khuyen-mai' class="btn btn-primary ms-2"><i className='fa fa-plus'></i></a>
                </div>
            </div>
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">Danh sách phiếu giảm giá</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Mã code</th>
                                <th>Tên phiếu</th>
                                <th>Giảm tối đa</th>
                                <th>Giá trị giảm</th>
                                <th>Đơn tối thiểu</th>
                                <th>Số lượng</th>
                                <th>Loại phiếu</th>
                                <th>Thời gian</th>
                                <th>Trạng thái</th>
                                <th class="sticky-col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            {items.map((item=>{
                                    return <tr>
                                        <td>{item.id}</td>
                                        <td>{item.maCode}</td>
                                        <td>{item.tenPhieu}</td>
                                        <td>{formatMoney(item.giaTriGiamToiDa)}</td>
                                        <td>{item.loaiPhieu == true ? formatMoney(item.giaTriGiam) : item.giaTriGiam + '%'}</td>
                                        <td>{formatMoney(item.donToiThieu)}</td>
                                        <td>{item.soLuong}</td>
                                        <td>{item.loaiPhieu == true ? 'Giảm tiền' : 'giảm %'}</td>
                                        <td>{item.ngayBatDau} - {item.ngayKetThuc}</td>
                                        <td>
                                            {item.trangThai === 0 ? "Không hoạt động" : "Đang hoạt động"}
                                        </td>

                                        <td class="sticky-col">
                                            <a href={'add-khuyen-mai?id=' + item.id} class="edit-btn"><i
                                                className='fa fa-edit'></i></a>
                                            <button onClick={() => deletePhieuGiamGia(item.id)} class="delete-btn"><i
                                                className='fa fa-trash'></i></button>
                                        </td>
                                    </tr>
                            }))}
                        </tbody>
                    </table>
                    <ReactPaginate
                        marginPagesDisplayed={2}
                        pageCount={pageCount}
                        onPageChange={handlePageClick}
                        containerClassName={'pagination'}
                        pageClassName={'page-item'}
                        pageLinkClassName={'page-link'}
                        previousClassName='page-item'
                        previousLinkClassName='page-link'
                        nextClassName='page-item'
                        nextLinkClassName='page-link'
                        breakClassName='page-item'
                        breakLinkClassName='page-link'
                        previousLabel='Trang trước'
                        nextLabel='Trang sau'
                        activeClassName='active'/>
                </div>
            </div>

        </>
    );
}

export default AdminPhieuGiamGia;